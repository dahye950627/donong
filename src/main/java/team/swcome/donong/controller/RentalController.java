package team.swcome.donong.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.RentalService;

@SessionAttributes("sessionBean")
@Controller
public class RentalController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	@Autowired
	RentalService RentalService;
	
	
	/*@RequestMapping(value = "rental", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		RentalService.getMainList();
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "rental/home";
	}*/
	
	/* ���� �뿩 ��� �������� �̵� */
	@RequestMapping(value = "/rental", method = RequestMethod.GET)
	public String rentalList() {
		return "rental/rentalList";
	}
	
	/* ���� �뿩 �۾��� �������� �̵� */
	@RequestMapping(value = "/rental/write", method = RequestMethod.GET)
	public String rentalWrite(Model model, SessionBean sessionBean) {
		sessionBean.setMemberNum(1); 					//�ӽ÷� ���س���
		int member_num = sessionBean.getMemberNum();
		
		Map map = new HashMap();
		map = RentalService.selectNameByPhone(member_num);
		
		model.addAttribute("name", map.get("name"));
		model.addAttribute("phone", map.get("phone"));
		
		return "rental/rentalWrite";
	}
	
	@RequestMapping(value = "/rental/write_ok", method = RequestMethod.POST)
	public String rentalWrite_ok(Locale locale, 
								 Model model,  
								 SessionBean sessionBean,
								 RentalDTO r,
								 FileDTO f) throws IllegalStateException, IOException {
		//int member_num = sessionBean.getMemberNum(); - �α��� ����Ǹ� �̷��� ������ ��
		
		sessionBean.setMemberNum(1); 					//�ӽ÷� ���س���
		int member_num = sessionBean.getMemberNum();
		r.setMember_num(member_num);
		
		int board_num = RentalService.insertFarm(r);	//�Խñ� ��ȣ�� �����ͼ� ����
		f.setBoard_num(board_num);
		RentalService.insertFile(f);
		
		return "rental/rentalList";
	}
	
	/*
	//�˻���ư ������ ���� ��
	@RequestMapping(value = "rental/search", method = RequestMethod.GET)
	public String rentalSearch(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	
	//�۾��� ���������� ��� ��ư ������ ���� �� 
	
	
	//���� ��ư ������ ���� ��
	@RequestMapping(value = "rental/delete", method = RequestMethod.POST)
	public String rentalDelete(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	*/
}
