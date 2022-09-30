package com.pet.home.sell;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.check.CheckDTO;
import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.util.Pager;
import com.pet.home.util.SellPager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value="/sell/*")
public class SellItemController {
	//아이템 등록, 수정, 삭제
	
	@Autowired
	private SellItemService itemService;	
	
	@GetMapping("Test")
	public void detailTest() {
	}
	
	@GetMapping("list")
	public ModelAndView getItemList(SellPager sellPager) throws Exception {
		System.out.println(sellPager.getItemCatg());
		ModelAndView mv = new ModelAndView();

	  List<SellItemDTO> ar	= itemService.getItemList(sellPager);
	  CategoryDTO categoryDTO = itemService.getCategory(sellPager.getItemCatg());
	  
	  mv.addObject("list", ar);
	  mv.addObject("pager",sellPager);
	  mv.addObject("category", categoryDTO);
	  return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetailOne(SellItemDTO sellItemDTO, ModelAndView model) throws Exception {
		sellItemDTO = itemService.getDetailOne(sellItemDTO);
		CategoryDTO categoryDTO = itemService.getCategory(sellItemDTO.getItemCatg());
		model.addObject("sellItemDTO", sellItemDTO);
		model.addObject("category", categoryDTO);
		return model;
	}
	
	@PostMapping("check")
	public void setCheck(CheckDTO checkDTO) {
		System.out.println(checkDTO.getItemNum());
	}

	
	@GetMapping("add")
	public void setItemAdd() throws Exception {
		System.out.println("add Get");
	}
	
	
	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO, MultipartFile [] files, HttpSession session) throws Exception {
		System.out.println("add Post");
		ModelAndView view = new ModelAndView();
		int result = itemService.setItemAdd(itemDTO, files, session.getServletContext());
		if(result>0) {
			view.setViewName("redirect:/sell/list?itemCatg="+itemDTO.getItemCatg());
			
		} else {
			view.setViewName("../");
		}
		return view;
	}	
	
	@GetMapping("update")
	public Model setItemUpdate(SellItemDTO dto, Model model) throws Exception {
		System.out.println("update");
		List<SellFileDTO> ar = dto.getFileDTOs();
		dto = itemService.getDetailOne(dto);
		model.addAttribute("dto", dto);
		return model;		
	}
	
	@PostMapping("update")
	public ModelAndView setItemUpdateResult(SellItemDTO itemDTO, MultipartFile [] files, HttpSession session) throws Exception {
		System.out.println("updatepost");
		int result = itemService.setItemUpdate(itemDTO, files, session.getServletContext());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/list?itemCatg="+itemDTO.getItemCatg());
		return mv;
	}
	
	@PostMapping("filedelete")
	@ResponseBody
	public int setFileDelete(SellFileDTO fileDTO, HttpSession session) throws Exception {
		int result = itemService.setUpdateFileDelete(fileDTO, session.getServletContext());
		return result;
	}
	
	@GetMapping("delete")
	public ModelAndView setItemDelete(SellItemDTO itemDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/list?itemCatg="+itemDTO.getItemCatg());
		int result = itemService.setItemDelete(itemDTO, session.getServletContext());
		
		return mv;
	}
	
	@PostMapping("pickadd")
	@ResponseBody
	public int setPickAdd(PickDTO pickDTO) throws Exception{
		PickDTO pickDTO2 = itemService.getPickCheck(pickDTO);
		if(pickDTO2 == null) {
			int result = itemService.setPickAdd(pickDTO);
			return result;
		}
		return 0;
	}
	
	@PostMapping("pickdelete")
	@ResponseBody
	public int setPickDelete(PickDTO pickDTO) throws Exception{
		int result = itemService.setPickDelete(pickDTO);
		return result;
	}
	
	@PostMapping("shopcartadd")
	@ResponseBody
	public int setShopCartAdd(ShopCartDTO shopCartDTO) throws Exception{
		ShopCartDTO shopCartDTO2 = itemService.getShopCartCheck(shopCartDTO);
		if(shopCartDTO2 == null) {
			int result = itemService.setShopCartAdd(shopCartDTO);
			return result;
		}
		return 0;
	}
	
	@PostMapping("shopcartdelete")
	@ResponseBody
	public int setShopCartDelete(ShopCartDTO shopCartDTO) throws Exception{
		int result = itemService.setShopCartDelete(shopCartDTO);
		return result;
	}
	
	@PostMapping("shopcartupdate")
	@ResponseBody
	public int setShopCartUpdate(ShopCartDTO shopCartDTO) throws Exception{
		int result = itemService.setShopCartUpdate(shopCartDTO);
		return result;
	}
	
	@GetMapping("reviewadd")
	public ModelAndView setReviewAdd(ReviewDTO reviewDTO) throws Exception {
		System.out.println("reviewadd Get");
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("./sell/reviewadd");
		return mv;
	}
	
	
	@PostMapping("reviewadd")
	public ModelAndView setReviewAddResult(ReviewDTO reviewDTO, MultipartFile [] files, HttpSession session) throws Exception {
		System.out.println("reviewadd Post");
		ModelAndView view = new ModelAndView();
		System.out.println(reviewDTO.getUserId());
		System.out.println(files.length);
		int result = itemService.setReviewAdd(reviewDTO, files, session.getServletContext());
		if(result>0) {
			view.setViewName("redirect:/sell/detail?itemNum="+reviewDTO.getItemNum());
			
		} else {
			view.setViewName("../");
		}
		return view;
	}
	
	@GetMapping("reviewList")
	@ResponseBody
	public Map<String, Object> getReviewList(com.pet.home.util.CommentPager commentPager) throws Exception{
		List<ReviewDTO> ar = itemService.getReviewList(commentPager);
		System.out.println(ar.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", commentPager);
		return map;
	}
	
	@GetMapping("reviewupdate")
	public ModelAndView getReviewUpdate(ReviewDTO reviewDTO) throws Exception{
		reviewDTO = itemService.getReviewUpdate(reviewDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("./sell/reviewupdate");
		return mv;
	}
	
	@PostMapping("reviewupdate")
	public String setReviewUpdate(ReviewDTO reviewDTO, MultipartFile [] files, HttpSession session) throws Exception {
		int result = itemService.setReviewUpdate(reviewDTO, files, session.getServletContext());
		return "redirect:./detail?itemNum="+reviewDTO.getItemNum();
	}
	
	@PostMapping("reviewdelete")
	@ResponseBody
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception{
		int result = itemService.setReviewDelete(reviewDTO);
		return result;
	}
	
	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(RvFileDTO rvFileDTO, HttpSession session) throws Exception{
		int result = itemService.setFileDelete(rvFileDTO, session.getServletContext());
		return result;
	}
	
	@PostMapping("reviewcommentalldelete")
	@ResponseBody
	public int setReviewCommentAllDelete(RvCommentDTO rvCommentDTO) throws Exception{
		int result = itemService.setReviewCommentAllDelete(rvCommentDTO);
		return result;
	}
	
	@PostMapping("reviewcommentdelete")
	@ResponseBody
	public int setReviewCommentDelete(RvCommentDTO rvCommentDTO) throws Exception{
		int result = itemService.setReviewCommentDelete(rvCommentDTO);
		return result;
	}
	
	@PostMapping("reviewcommentadd")
	@ResponseBody
	public int setReviewCommentAdd(RvCommentDTO rvCommentDTO) throws Exception{
		int result = itemService.setReviewCommentAdd(rvCommentDTO);
		return result;
	}
	
	@PostMapping("reviewcommentupdate")
	@ResponseBody
	public int setReviewCommentUpdate(RvCommentDTO rvCommentDTO) throws Exception{
		int result = itemService.setReviewCommentUpdate(rvCommentDTO);
		return result;
	}
	
	
	
	@GetMapping("map")
	public ModelAndView getMap(SellItemDTO itemDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		itemDTO = itemService.getMap();
		mv.addObject("address", itemDTO);
		mv.setViewName("sell/map");
		return mv;
	}
	
	
	@GetMapping("search")
	public ModelAndView getItemOne(SellPager sellPager) throws Exception {
		System.out.println(sellPager.getItemCatg());
		System.out.println(sellPager.getSearch());
		  List<SellItemDTO> ar	= itemService.getItemList(sellPager);
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("list", ar);
		  mv.addObject("pager",sellPager);
		  return mv;
		}

	
	@GetMapping("pettx")
	public void getPetTaxi () {
		
	}

	
IamportClient client = new IamportClient("7768266328715148", "uETnhxe3MbNMjFN4Gs6U5PuiYYR6TWf9SFcGncxj9SWEcDAysad8JZmNnOYpChUkXzIdw7Ld9uTaSWuP", true);
	
	public void getToken() throws Exception {
		IamportResponse<AccessToken> ipList = client.getAuth();
		
	}
	
	@PostMapping("payments")
	@ResponseBody
	public void setCheck(@RequestBody String imp_uid, @RequestParam String merchant_uid) throws Exception {
			System.out.println("payments/complete");
			System.out.println(imp_uid);
			System.out.println(merchant_uid);
			String test_imp_uid = "imp12326472";
            IamportResponse<Payment> payment_response = client.paymentByImpUid(test_imp_uid);
            System.out.println(payment_response.getResponse().getAmount());
	}

	
}