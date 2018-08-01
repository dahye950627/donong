package team.swcome.donong.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	@Autowired
	S3Service s3Service;
	S3Util s3Util = new S3Util();
	String bucketName = "donong-s3";

	private String saveFolder = "C:\\Users\\?΄?€?\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";

	/* ?μ§? ???¬κΈ? ?½? */
	public int insertFarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";

		// λ‘κ·Έ?Έ? ?¬? ?΄λ¦? κ°?? Έ?€κΈ?
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();

		// ??, ?κ΅°κ΅¬, ? λͺ?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// κΈ? ? λͺ?
		title = sido + " " + sigungu + " " + ri;

		// ??, ?κ΅°κ΅¬ λ²νΈ
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);
		r.setWriter(writer);

		rentalMapper.insertFarm(r);
		return r.getNum();
	}

	/* ?μ§? ???¬ κΈ? ??Ό ?½? */
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?΄?λͺ?
		
		//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
		ResponseEntity<String> img_path = new ResponseEntity<>
		(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
		
		//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
		String certificatePath = (String) img_path.getBody();

		/* μ²«λ²μ§? ??Ό */
		// ?? ??Όλͺ? ???₯
		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		// λ°λ?? ??ΌλͺμΌλ‘? ???₯
		f.setFilePath1(certificatePath);

		/* ?λ²μ§Έ ??Ό */
		if (!file2.isEmpty()) {
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			certificatePath = (String) img_path.getBody();
			
			fileName = file2.getOriginalFilename();
			
			f.setFileName2(fileName);
			f.setFilePath2(certificatePath);
		}

		/* ?Έλ²μ§Έ ??Ό */
		if (!file3.isEmpty()) {
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			certificatePath = (String) img_path.getBody();
			
			fileName = file3.getOriginalFilename();
			
			f.setFileName3(fileName);
			f.setFilePath3(certificatePath);
		}

		/* ?€λ²μ§Έ ??Ό */
		if (!file4.isEmpty()) {
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			certificatePath = (String) img_path.getBody();
			
			fileName = file4.getOriginalFilename();
			
			f.setFileName4(fileName);
			f.setFilePath4(certificatePath);
			
		} 
		rentalMapper.insertFile(f);
	}

	/* λ‘κ·Έ?Έ? ?¬? ?΄λ¦?, ?Έ??° κ°?? Έ?€κΈ? */
	public MemberDTO selectNameByPhone(int num) {
		MemberDTO m = memberMapper.selectMemberByNum(num);
		System.out.println("name = " + m.getRealname());
		return m;
	};

	/* ?μ§? ???¬ λ¦¬μ€?Έ κ°?? Έ?€κΈ? */
	public List<RentalDTO> selectRentalList() {
		List<RentalDTO> list = rentalMapper.selectRentalList();
		return list;
	};

	/* ??? ?΄λ―Έμ? path κ°?? Έ?€κΈ? */
	public String[] selectRepresentImg() {
		String[] filepath = rentalMapper.selectRepresentImg();
		return filepath;
	};

	/* ?μ§? ???¬ κΈ? ??Έλ³΄κΈ° κ°?? Έ?€κΈ? */
	public RentalDTO selectRentalView(int board_num) {
		RentalDTO r = rentalMapper.selectRentalView(board_num);
		return r;
	};

	/* ??Έλ³΄κΈ°?? ?¬μ§λ€ κ²½λ‘ κ΅¬ν΄?€κΈ? */
	public FileDTO selectFileNamePath(int board_num) {
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		return f;
	};

	/* ?μ§? ???¬ κΈ? ?­?  */
	public void deleteRental(int board_num) {
		rentalMapper.deleteRental(board_num);
	};

	/* ?μ§? ???¬ ??Ό ?­?  */
	public ResponseEntity<String> deleteFiles(Map m) {
		int board_num = (int)m.get("board_num");
		String directory = (String)m.get("directory");
		
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		String[] fpath = new String[4];
		fpath[0] = f.getFilePath1();
		fpath[1] = f.getFilePath2();
		fpath[2] = f.getFilePath3();
		fpath[3] = f.getFilePath4();
		
		String inputDirectory = null;
		if(directory.equals("rent")) {
			inputDirectory = "rent";
		}
		
		//μ²? λ²μ§Έ ?΄λ―Έμ? ?­? 
		s3Util.fileDelete(bucketName, inputDirectory+fpath[0]);
		
		//? λ²μ§Έ ?΄λ―Έμ? ?­? 
		if(!fpath[1].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[1]);
		}
		
		//?Έ λ²μ§Έ ?΄λ―Έμ? ?­? 
		if(!fpath[2].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[2]);
		}
		
		//?€ λ²μ§Έ ?΄λ―Έμ? ?­? 
		if(!fpath[3].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[3]);
		}
		rentalMapper.deleteFiles(m);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	};

	/* ?μ§? κ²μκΈ? κ²?? */
	public List<RentalDTO> selectSearch(RentalDTO r) {
		List<RentalDTO> list = rentalMapper.selectSearch(r);
		String represent[] = rentalMapper.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(represent[i]);
		}

		return list;
	};

	/* ?μ§? κΈ? ??  */
	public void updateRental(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();

		// ??, ?κ΅°κ΅¬, ? λͺ?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// κΈ? ? λͺ?
		title = sido + " " + sigungu + " " + ri;

		// ??, ?κ΅°κ΅¬ λ²νΈ
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);

		rentalMapper.updateRental(r);
	};

	/* ?μ§? ??Ό ??  */
	public void updateFiles(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?΄?λͺ?
		
		FileDTO f2 = rentalMapper.selectFileNamePath(f.getBoard_num());
		
		
		if(!f.getFile1().isEmpty()) {	//??Ό1?΄ λ³?κ²½λ?? ?
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			String certificatePath = (String) img_path.getBody();

			// ?? ??Όλͺ? ???₯
			String fileName = file1.getOriginalFilename();
			f.setFileName1(fileName);

			// λ°λ?? ??ΌλͺμΌλ‘? ???₯
			f.setFilePath1(certificatePath);
		}else {	//??Ό1?΄ λ³?κ²½λμ§? ??? ?
			f.setFileName1(f2.getFileName1());
			f.setFilePath1(f2.getFilePath1());
		}
		
		if(!f.getFile2().isEmpty()) {	//??Ό1?΄ λ³?κ²½λ?? ?
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			String certificatePath = (String) img_path.getBody();

			// ?? ??Όλͺ? ???₯
			String fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			// λ°λ?? ??ΌλͺμΌλ‘? ???₯
			f.setFilePath2(certificatePath);
		}else {	//??Ό1?΄ λ³?κ²½λμ§? ??? ?
			f.setFileName2(f2.getFileName2());
			f.setFilePath2(f2.getFilePath2());
		}
		
		if(!f.getFile3().isEmpty()) {	//??Ό1?΄ λ³?κ²½λ?? ?
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			String certificatePath = (String) img_path.getBody();

			// ?? ??Όλͺ? ???₯
			String fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			// λ°λ?? ??ΌλͺμΌλ‘? ???₯
			f.setFilePath3(certificatePath);
		}else {	//??Ό1?΄ λ³?κ²½λμ§? ??? ?
			f.setFileName2(f2.getFileName3());
			f.setFilePath2(f2.getFilePath3());
		}
		
		if(!f.getFile4().isEmpty()) {	//??Ό1?΄ λ³?κ²½λ?? ?
			//?¬λ¦°μ£Ό? λ¦¬ν΄λ°μ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//λ°μ?κ±? μ£Όμ String ?Όλ‘? λ°κΏμ€?
			String certificatePath = (String) img_path.getBody();

			// ?? ??Όλͺ? ???₯
			String fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			// λ°λ?? ??ΌλͺμΌλ‘? ???₯
			f.setFilePath4(certificatePath);
		}else {	//??Ό1?΄ λ³?κ²½λμ§? ??? ?
			f.setFileName4(f2.getFileName4());
			f.setFilePath4(f2.getFilePath4());
		}
		rentalMapper.updateFiles(f);
	};
}
