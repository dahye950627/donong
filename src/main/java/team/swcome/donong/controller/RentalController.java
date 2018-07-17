package team.swcome.donong.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.swcome.donong.service.FarmService;


@Controller
public class RentalController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	@Autowired
	FarmService farmService;
	
	
	@RequestMapping(value = "/farm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		farmService.getMainList();
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "farm/home";
	}
	
	/* ���� �뿩 ��� �������� �̵� */
	@RequestMapping(value = "rental/list", method = RequestMethod.GET)
	public String rentalList(Locale locale, Model model) {
		return "rental/rentalList";
	}
	
	/* ���� �뿩 �۾��� �������� �̵� */
	@RequestMapping(value = "rental/write", method = RequestMethod.GET)
	public String rentalWrite(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	
	/*
	//�˻���ư ������ ���� ��
	@RequestMapping(value = "rental/search", method = RequestMethod.GET)
	public String rentalSearch(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	
	//�۾��� ���������� ��� ��ư ������ ���� �� 
	@RequestMapping(value = "rental/write_ok", method = RequestMethod.POST)
	public String rentalWrite_ok(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	
	//���� ��ư ������ ���� ��
	@RequestMapping(value = "rental/delete", method = RequestMethod.POST)
	public String rentalDelete(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	*/
}
