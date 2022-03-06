package com.bitcamp.hgs.member.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.member.dao.MemberDao;
import com.bitcamp.hgs.member.domain.InsertMember;
import com.bitcamp.hgs.member.domain.Member;
import com.bitcamp.hgs.member.domain.MemberHashtag;
import com.bitcamp.hgs.member.domain.RegMember;

@Service
public class MemberService {
	
	private SqlSessionTemplate template;
	private BCryptPasswordEncoder encoder;
	private MailSenderService senderService;

	MemberService(	SqlSessionTemplate template,BCryptPasswordEncoder encoder,	MailSenderService senderService){
		this.template = template;
		this.encoder = encoder;
		this.senderService = senderService;
	}
	
	/*
	 *  1. 파일저장
	 *  2. 비밀번호 암호화
	 *  3. Sns계정 사용자 확인하여, email = snsId
	 *  4. DB에 회원저장
	 *  5. DB에 해쉬태그 저장
	 *  6. 메일발송
	 */
	public void insertMember(RegMember regMember, HttpServletRequest request) throws IllegalStateException, IOException  {
		System.out.println("regMember = "+ regMember);
		// DB관련 예외 발생 시  삭제처리를 위한 File 객체 변수 선언
		File newFile = null;
		String savePath = request.getSession().getServletContext().getRealPath("/uploadfile");
		
		// 파일이 있다면 저장
		if(!regMember.getProfile().isEmpty() && regMember.getProfile().getSize() > 0) {
			String[] files = regMember.getProfile().getOriginalFilename().split("\\.");
			String exet = files[files.length - 1];
			String newFileName = System.nanoTime() + "." + exet;
			newFile = new File(savePath, newFileName);
			regMember.getProfile().transferTo(newFile);
		} 
		
		// 파일이 없다면 기본 이미지
		else newFile = new File("noProfile.jpg");
		
		
		// 비밀번호 암호화
		regMember.setPassword(encoder.encode(regMember.getPassword()));
		
		// sns계정 이용하는 분이라면, email = snsId 
		int snsType = 0;
		if(regMember.getSnsId() != null ) 	{
			regMember.setEmail(regMember.getSnsId());
			snsType = regMember.getSnsType().equals("kakao") ? 0 : 1;
		}
		
		
		
		// DB에 저장할 유저정보 생성 및 DB에 저장
		InsertMember insertMember = new InsertMember(
				regMember.getEmail(),	
				regMember.getPassword(), 
				regMember.getName(), 	 
				regMember.getPetNumber(),
				newFile.getName(),
				regMember.getAddress(),  
				regMember.getBirthday(), 
				Integer.parseInt(regMember.getSex()),		
				Integer.parseInt(regMember.getNeutering()),
				Integer.parseInt(regMember.getBreedIdx()), 
				regMember.getSnsId(),
				snsType
		);

		template.insert("com.bitcamp.hgs.member.dao.MemberDao.insertMemberInfo", insertMember);
		

		// 유저의 hashtag Data가 있을 때, DB에 저장한다.
		if(!regMember.getHashtagIdx().isEmpty()) {
			
			System.out.println(insertMember.getMemberIdx()+"의 해쉬태그 정보를 저장하겠습니다. ");
		
			// 리스트에 유저id와 hashtag 아이디 저장
			List<MemberHashtag> memberHashtagList = new ArrayList<MemberHashtag>();
			for (int i = 0; i < regMember.getHashtagIdx().size(); i++) {
				int hashtagIdx = Integer.parseInt(regMember.getHashtagIdx().get(i));
				memberHashtagList.add(new MemberHashtag(insertMember.getMemberIdx(),hashtagIdx));
			}
		
			// DB저장
			template.insert("com.bitcamp.hgs.member.dao.MemberDao.insertMemberHashtag", memberHashtagList);
			System.out.println(insertMember.getMemberIdx()+"의 해쉬태그들 저장완료 ");
		}
		
		// 메일발송
		if(senderService.send(insertMember.getEmail(), insertMember.getName()) > 0) {
			System.out.printf("%s님에게 메일을 발송했습니다.",insertMember.getName());
		}else{
			System.out.printf("%s님에게 메일 발송이 실패했습니다.",insertMember.getName());
		};
	}

	// sns유저의 이메일 정보가 있는지 확인
	public Member selectOauthId(String email) {
		return template.getMapper(MemberDao.class).selectMember(email);
	}
	
}
