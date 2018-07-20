package team.swcome.donong.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	
	private String saveFolder = "C:\\Users\\�̴���\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";
	
	public List<RentalDTO> getMainList(){
		return rentalMapper.selectAll();
	}
	
	public int insertFarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";
		
		//�α����� ��� �̸� ��������
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();
		
		//�õ�, �ñ���, ����
		StringTokenizer st = new StringTokenizer(address," ");
		sido = st.nextToken();
		sigungu = st.nextToken();
		ri = st.nextToken();
		title = sido + " " + sigungu + " " + ri;
		
		r.setTitle(title);
		r.setWriter(writer);
		r.setSido(sido);
		r.setSigungu(sigungu);
		
		int board_num = rentalMapper.insertFarm(r);
		return board_num;
	}
	
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		// ������ ���� �̸�: ���� ��+��+��
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		
		// ���� ��ü �����մϴ�.
		File path = new File(homedir);
		
		// ������ �����ϴ��� Ȯ���մϴ�.
		if (!(path.exists())) {
			System.out.println("���� ������");
			path.mkdir(); // ���ο� ������ ����
		}
		
		// ������ ���մϴ�.
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		/* ù��° ���� */
		// ���� ���ϸ� ����
		String fileName = file1.getOriginalFilename();			
		f.setFileName1(fileName);
		
		// Ȯ����
		int index = fileName.lastIndexOf(".");
		String fileExtension = fileName.substring(index+1);	
		System.out.println("Ȯ����1 = " + fileExtension);
		
		// ���ο� ���ϸ��� ����
		String refileName = "farm" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName1 = " + refileName);
		
		// ����Ŭ ��� ����� ���ڵ� ��
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName1 = " + fileDBName);

		// transferTo(FIle path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
		file1.transferTo(new File(saveFolder + fileDBName));
		// �ٲ� ���ϸ����� ����
		f.setFilePath1(fileDBName);
		
		
		if(!file2.isEmpty()) {
			/* �ι�° ���� */
			// ���� ���ϸ� ����
			fileName = file2.getOriginalFilename();			
			f.setFileName2(fileName);
			
			// Ȯ����
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("Ȯ����2 = " + fileExtension);
			
			// ���ο� ���ϸ��� ����
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName2 = " + refileName);
			
			// ����Ŭ ��� ����� ���ڵ� ��
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName2 = " + fileDBName);

			// transferTo(FIle path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
			file2.transferTo(new File(saveFolder + fileDBName));
			// �ٲ� ���ϸ����� ����
			f.setFilePath2(fileDBName);
		}else {
			f.setFileName2("");
			f.setFilePath2("");
		}
		
		if(!file3.isEmpty()) {
			/* ����° ���� */
			// ���� ���ϸ� ����
			fileName = file3.getOriginalFilename();			
			f.setFileName3(fileName);
			
			// Ȯ����
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("Ȯ����3 = " + fileExtension);
			
			// ���ο� ���ϸ��� ����
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName3 = " + refileName);
			
			// ����Ŭ ��� ����� ���ڵ� ��
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName3 = " + fileDBName);

			// transferTo(FIle path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
			file1.transferTo(new File(saveFolder + fileDBName));
			// �ٲ� ���ϸ����� ����
			f.setFilePath3(fileDBName);
		}else {
			f.setFileName3("");
			f.setFilePath3("");
		}
		
		if(!file4.isEmpty()) {
			/* �׹�° ���� */
			// ���� ���ϸ� ����
			fileName = file4.getOriginalFilename();			
			f.setFileName4(fileName);
			
			// Ȯ����
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index+1);	
			System.out.println("Ȯ����4 = " + fileExtension);
			
			// ���ο� ���ϸ��� ����
			refileName = "rental" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName4 = " + refileName);
			
			// ����Ŭ ��� ����� ���ڵ� ��
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName4 = " + fileDBName);

			// transferTo(FIle path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
			file1.transferTo(new File(saveFolder + fileDBName));
			// �ٲ� ���ϸ����� ����
			f.setFilePath4(fileDBName);
		}else {
			f.setFileName4("");
			f.setFilePath4("");
		}
		
		rentalMapper.insertFile(f);
		
	}
	
	public Map selectNameByPhone(int num) {
		MemberDTO m = memberMapper.selectMemberByNum(num);
		String name = m.getRealname();
		String phone = m.getPhone();
		
		Map map = new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		
		return map;
	};
}
