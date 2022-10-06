package com.pet.home.sell;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.JsonObject;
import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.purchase.PurchaseDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.util.SellPager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value = "/sell/*")
public class SellItemController {
	// 아이템 등록, 수정, 삭제

	@Autowired
	private SellItemService itemService;
	
	
	@GetMapping("Test")
	public void detailTest() {
	}

	@GetMapping("list")
	public ModelAndView getItemList(SellPager sellPager) throws Exception {
		System.out.println(sellPager.getItemCatg());
		ModelAndView mv = new ModelAndView();

		List<SellItemDTO> ar = itemService.getItemList(sellPager);
		CategoryDTO categoryDTO = itemService.getCategory(sellPager.getItemCatg());

		mv.addObject("list", ar);
		mv.addObject("pager", sellPager);
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
	public void setCheck(PurchaseDTO checkDTO) {
		System.out.println(checkDTO.getItemNum());
	}

	@GetMapping("add")
	public void setItemAdd() throws Exception {
		System.out.println("add Get");
	}

	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		System.out.println("add Post");
		ModelAndView view = new ModelAndView();
		session.getAttribute("member");
		int result = itemService.setItemAdd(itemDTO, files, session.getServletContext());
		if (result > 0) {
			view.setViewName("redirect:/sell/list?itemCatg=" + itemDTO.getItemCatg());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("update")
	public Model setItemUpdate(SellItemDTO dto, Model model) throws Exception {
		System.out.println("itemupdate");
		List<SellFileDTO> ar = dto.getFileDTOs();
		dto = itemService.getDetailOne(dto);
		model.addAttribute("dto", dto);
		return model;
	}

	@PostMapping("update")
	public ModelAndView setItemUpdateResult(SellItemDTO itemDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		System.out.println("updatepost");
		int result = itemService.setItemUpdate(itemDTO, files, session.getServletContext());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/selllist?itemCatg=" + itemDTO.getItemCatg());
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
		mv.setViewName("redirect:/sell/list?itemCatg=" + itemDTO.getItemCatg());
		int result = itemService.setItemDelete(itemDTO, session.getServletContext());

		return mv;
	}

	@PostMapping("pickadd")
	@ResponseBody
	public int setPickAdd(PickDTO pickDTO) throws Exception {
		PickDTO pickDTO2 = itemService.getPickCheck(pickDTO);
		if (pickDTO2 == null) {
			int result = itemService.setPickAdd(pickDTO);
			return result;
		}
		return 0;
	}

	@PostMapping("pickdelete")
	@ResponseBody
	public int setPickDelete(PickDTO pickDTO) throws Exception {
		int result = itemService.setPickDelete(pickDTO);
		return result;
	}

	@PostMapping("shopcartadd")
	@ResponseBody
	public int setShopCartAdd(ShopCartDTO shopCartDTO) throws Exception {
		ShopCartDTO shopCartDTO2 = itemService.getShopCartCheck(shopCartDTO);
		if (shopCartDTO2 == null) {
			int result = itemService.setShopCartAdd(shopCartDTO);
			return result;
		}
		return 0;
	}

	@PostMapping("shopcartdelete")
	@ResponseBody
	public int setShopCartDelete(ShopCartDTO shopCartDTO) throws Exception {
		int result = itemService.setShopCartDelete(shopCartDTO);
		return result;
	}

	@PostMapping("shopcartupdate")
	@ResponseBody
	public int setShopCartUpdate(ShopCartDTO shopCartDTO) throws Exception {
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
	public ModelAndView setReviewAddResult(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		System.out.println("reviewadd Post");
		ModelAndView view = new ModelAndView();
		System.out.println(reviewDTO.getUserId());
		System.out.println(files.length);
		int result = itemService.setReviewAdd(reviewDTO, files, session.getServletContext());
		if (result > 0) {
			view.setViewName("redirect:/sell/detail?itemNum=" + reviewDTO.getItemNum());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("reviewList")
	@ResponseBody
	public Map<String, Object> getReviewList(com.pet.home.util.CommentPager commentPager) throws Exception {
		List<ReviewDTO> ar = itemService.getReviewList(commentPager);
		System.out.println(ar.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", commentPager);
		return map;
	}

	@GetMapping("reviewupdate")
	public ModelAndView getReviewUpdate(ReviewDTO reviewDTO) throws Exception {
		reviewDTO = itemService.getReviewUpdate(reviewDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("./sell/reviewupdate");
		return mv;
	}

	@PostMapping("reviewupdate")
	public String setReviewUpdate(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = itemService.setReviewUpdate(reviewDTO, files, session.getServletContext());
		return "redirect:./detail?itemNum=" + reviewDTO.getItemNum();
	}

	@PostMapping("reviewdelete")
	@ResponseBody
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		int result = itemService.setReviewDelete(reviewDTO);
		return result;
	}

	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(RvFileDTO rvFileDTO, HttpSession session) throws Exception {
		int result = itemService.setFileDelete(rvFileDTO, session.getServletContext());
		return result;
	}

	@PostMapping("reviewcommentalldelete")
	@ResponseBody
	public int setReviewCommentAllDelete(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentAllDelete(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentdelete")
	@ResponseBody
	public int setReviewCommentDelete(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentDelete(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentadd")
	@ResponseBody
	public int setReviewCommentAdd(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentAdd(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentupdate")
	@ResponseBody
	public int setReviewCommentUpdate(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentUpdate(rvCommentDTO);
		return result;
	}

	@GetMapping("sellqnaadd")
	public ModelAndView setSellQnaAdd(SellQnaDTO sellQnaDTO) throws Exception {
		System.out.println("sellqnaadd Get");
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellQnaDTO", sellQnaDTO);
		mv.setViewName("./sell/sellqnaadd");
		return mv;
	}

	@PostMapping("sellqnaadd")
	public ModelAndView setSellQnaAddResult(SellQnaDTO sellQnaDTO) throws Exception {
		System.out.println("sellqnaadd Post");
		ModelAndView view = new ModelAndView();
		int result = itemService.setSellQnaAdd(sellQnaDTO);
		if (result > 0) {
			view.setViewName("redirect:/sell/detail?itemNum=" + sellQnaDTO.getItemNum());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("qnaList")
	@ResponseBody
	public Map<String, Object> getSellQnaList(com.pet.home.util.CommentPager commentPager) throws Exception {
		List<SellQnaDTO> ar = itemService.getSellQnaList(commentPager);
		System.out.println(ar.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", commentPager);
		return map;
	}

	@GetMapping("qnaupdate")
	public ModelAndView getSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception {
		sellQnaDTO = itemService.getSellQnaUpdate(sellQnaDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellQnaDTO", sellQnaDTO);
		mv.setViewName("./sell/qnaupdate");
		return mv;
	}

	@PostMapping("qnaupdate")
	public String setSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception {
		int result = itemService.setSellQnaUpdate(sellQnaDTO);
		return "redirect:./detail?itemNum=" + sellQnaDTO.getItemNum();
	}

	@PostMapping("qnadelete")
	@ResponseBody
	public int setSellQnaDelete(SellQnaDTO sellQnaDTO) throws Exception {
		int result = itemService.setSellQnaDelete(sellQnaDTO);
		return result;
	}

	@PostMapping("qnacommentalldelete")
	@ResponseBody
	public int setSellQnaCommentAllDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentAllDelete(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentdelete")
	@ResponseBody
	public int setSellQnaCommentDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentDelete(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentadd")
	@ResponseBody
	public int setSellQnaCommentAdd(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentAdd(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentupdate")
	@ResponseBody
	public int setSellQnaCommentUpdate(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentUpdate(sellQnaCommentDTO);
		return result;
	}

	@GetMapping("map")
	public ModelAndView getMap(SellItemDTO itemDTO) throws Exception {
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
		List<SellItemDTO> ar = itemService.getItemList(sellPager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("pager", sellPager);
		return mv;
	}

	//결제 진행 후 DB 인서트
	@PostMapping("payments")
	@ResponseBody
	public String setPurchase(@RequestParam String imp_uid, 
			@RequestParam String merchant_uid, 
			@RequestParam String itemNum,
			@RequestParam String amount,
			@RequestParam String userId,
			@RequestParam(required = false) String revStartDate,
			@RequestParam String revEndDate,
			@RequestParam String adultsCount,
			@RequestParam String dogCount,
			HttpSession session) throws Exception {
					
			//토큰 발급
			IamportResponse<AccessToken> token = itemService.getToken();
			
			IamportClient client = itemService.getClient();
			
			Payment payment = client.paymentByImpUid(imp_uid).getResponse();
			String paymentResult = payment.getStatus();
			System.out.println("결제 객체: "+payment);
			System.out.println("결제 상태: "+paymentResult);
			System.out.println("Code: "+token.getCode());
			System.out.println("token: "+token.getResponse().getToken());
			
			//결제되어야 할 금액 계산
			SellItemDTO itemDTO = new SellItemDTO();
			itemDTO.setItemNum(Long.parseLong(itemNum));
			itemDTO = itemService.getDetailOne(itemDTO);
			Long itemPrice = itemDTO.getItemPrice();
			System.out.println("itemPrice: "+itemPrice);
			
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(revStartDate);
	        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(revEndDate);
	        Long diffSec = (end.getTime() - start.getTime()) / 1000; //초 차이
	        Long revDays = diffSec / (24*60*60); //일자수 차이
	        System.out.println("revDays: "+revDays);
			Long totalPrice = (itemPrice * revDays)+(10000*Long.parseLong(adultsCount))+(10000*Long.parseLong(dogCount));
			System.out.println("totalPrice: "+totalPrice);
			
			//실제 결제 금액과 DB상 결제되어야 하는 금액 비교
			if(amount.equals(totalPrice.toString())) {
				if(paymentResult.equals("paid")) {
					PurchaseDTO purchaseDTO = new PurchaseDTO();
					purchaseDTO.setImp_uid(imp_uid);
					purchaseDTO.setMerchant_uid(merchant_uid);
					purchaseDTO.setItemNum(Long.parseLong(itemNum));
					purchaseDTO.setAmount(Long.parseLong(amount));
					purchaseDTO.setRevStartDate(revStartDate);
					purchaseDTO.setRevEndDate(revEndDate);
					purchaseDTO.setAdultsCount(Long.parseLong(adultsCount));
					purchaseDTO.setDogCount(Long.parseLong(dogCount));
					purchaseDTO.setUserId(userId);
					
					int result = itemService.setPurchase(purchaseDTO);
					
					return paymentResult;
					
				} else {
					return paymentResult;
				}
			} else {
				return paymentResult;
				
			}
						
//			IamportResponse<Payment> payment_response = client.paymentByImpUid(imp_uid);
                          	            
            }
	
	//결제 리스트 출력
	public ModelAndView getPurchaseList(String userId) throws Exception{
		PurchaseDTO checkDTO = new PurchaseDTO();
		checkDTO.setUserId(userId);
		System.out.println(checkDTO.getUserId());
//		List<CheckDTO> checkList = itemService.getPurchaseList(checkDTO);
		ModelAndView mv = new ModelAndView();
//		mv.addObject("checkList", checkList);
		return mv;		
	}
	


//public String getToken() {
//		
//		RestTemplate restTemplate = new RestTemplate();
//	
//		//서버로 요청할 Header
//		 HttpHeaders headers = new HttpHeaders();
//	    headers.setContentType(MediaType.APPLICATION_JSON);
//		
//	    
//	    Map<String, Object> map = new HashMap<>();
//	    map.put("imp_key", "imp_key");
//	    map.put("imp_secret", "imp_secret");
//	    
//	   
//	    Gson var = new Gson();
//	    String json=var.toJson(map);
//		//서버로 요청할 Body
//	   
//	    HttpEntity<String> entity = new HttpEntity<>(json,headers);
//		return restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
//		
//		
//	}
//
//public String requestSubPay() {
//
//	String token = pay.getToken();
//	Gson str = new Gson();
//	token = token.substring(token.indexOf("response") + 10);
//	token = token.substring(0, token.length() - 1);
//
//	GetTokenVO vo = str.fromJson(token, GetTokenVO.class);
//
//	String access_token = vo.getAccess_token();
//	System.out.println(access_token);
//
//	RestTemplate restTemplate = new RestTemplate();
//
//	HttpHeaders headers = new HttpHeaders();
//	headers.setContentType(MediaType.APPLICATION_JSON);
//	headers.setBearerAuth(access_token);
//
//	Map<String, Object> map = new HashMap<>();
//	map.put("customer_uid", "24");
//	map.put("merchant_uid", "162443471100");
//	map.put("amount", "10000");
//	map.put("name", "test05");
//
//	Gson var = new Gson();
//	String json = var.toJson(map);
//	System.out.println(json);
//	HttpEntity<String> entity = new HttpEntity<>(json, headers);
//	
//	return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/again", entity, String.class);
//
//}
	
}

	
