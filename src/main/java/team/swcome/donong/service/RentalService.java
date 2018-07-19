package team.swcome.donong.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.mapper.MemberMapper;
import team.swcome.donong.mapper.RentalMapper;

@Service
public class RentalService {
	
	@Autowired
	RentalMapper rentalMapper;
	@Autowired
	MemberMapper memberMapper;
	
	private String saveFolder = "C:\\Users\\이다혜\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";
	
	public List<RentalDTO> getMainList(){
		return rentalMapper.selectAll();
	}
	
	public void insertfarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";
		
		//로그인한 사람 이름 가져오기
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();
		
		//시도, 시군구, 제목
		StringTokenizer st = new StringTokenizer(address," ");
		sido = st.nextToken();
		sigungu = st.nextToken();
		ri = st.nextToken();
		title = sido + " " + sigungu + " " + ri;
		
		r.setTitle(title);
		r.setWriter(writer);
		r.setSido(sido);
		r.setSigungu(sigungu);
		
		rentalMapper.insertfarm(r);
	}
	
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		// 생성할 폴더 이름: 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		
		// 파일 객체 생성합니다.
		File path = new File(homedir);
		
		// 폴더가 존재하는지 확인합니다.
		if (!(path.exists())) {
			System.out.println("폴더 만들어요");
			path.mkdir(); // 새로운 폴더를 생성
		}
		
		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		/* 첫번째 파일 */
		// 원래 파일명 저장
		String fileName = file1.getOriginalFilename();			
		f.setFileName1(fileName);
		
		// 확장자
		int index = fileName.lastIndexOf(".");
		String fileExtension = fileName.substring(index+1);	
		System.out.println("확장자1 = " + fileExtension);
		
		// 새로운 파일명을 저장
		String refileName = "rental" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName1 = " + refileName);
		
		// 오라클 디비에 저장될 레코드 값
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName1 = " + fileDBName);

		// transferTo(FIle path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		file1.transferTo(new File(saveFolder + fileDBName));
		// 바뀐 파일명으로 저장
		f.setFilePath1(fileDBName);
		
		
		if(!file2.isEmpty()) {
			/* 두번째 파일 */
			// 원래 파일명 저장
			fileName = file2.getOriginalFilename();			
			f.setFileName2(fileName);
			
			// 확장자
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("확장자2 = " + fileExtension);
			
			// 새로운 파일명을 저장
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName2 = " + refileName);
			
			// 오라클 디비에 저장될 레코드 값
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName2 = " + fileDBName);

			// transferTo(FIle path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			file2.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			f.setFilePath2(fileDBName);
		}
		
		if(!file3.isEmpty()) {
			/* 세번째 파일 */
			// 원래 파일명 저장
			fileName = file3.getOriginalFilename();			
			f.setFileName3(fileName);
			
			// 확장자
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("확장자3 = " + fileExtension);
			
			// 새로운 파일명을 저장
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName3 = " + refileName);
			
			// 오라클 디비에 저장될 레코드 값
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName3 = " + fileDBName);

			// transferTo(FIle path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			file1.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			f.setFilePath3(fileDBName);
		}
		
		if(!file4.isEmpty()) {
			/* 네번째 파일 */
			// 원래 파일명 저장
			fileName = file4.getOriginalFilename();			
			f.setFileName4(fileName);
			
			// 확장자
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("확장자4 = " + fileExtension);
			
			// 새로운 파일명을 저장
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName4 = " + refileName);
			
			// 오라클 디비에 저장될 레코드 값
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName4 = " + fileDBName);

			// transferTo(FIle path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			file1.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			f.setFilePath4(fileDBName);
		}
		
		rentalMapper.insertFile(f);
		
	}
}
