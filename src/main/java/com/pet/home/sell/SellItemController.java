package com.pet.home.sell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping(value="/sell/*")
public class SellItemController {
	//아이템 등록, 수정, 삭제
	
	@Autowired
	private SellItemService itemService;	
	
	@GetMapping("list")
	public ModelAndView getItemList(SellItemDTO dto) throws Exception {
	  List<SellItemDTO> ar	= itemService.getItemList(dto);
	  System.out.println(dto.getItemCatg());
	  CategoryDTO categoryDTO = itemService.getCategory(dto.getItemCatg());
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("list",ar);
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
	
	
	@GetMapping("search")
	public ModelAndView getItemOne(String search, String kind) throws Exception {
		System.out.println("search: "+search);
		System.out.println("kind: "+kind);
		Pager pager = new Pager();
		pager.setKind(kind);
		pager.setSearch(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		List<SellItemDTO> ar = itemService.getItems(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		return mv;
		}
	
	@PostMapping("search")
	public void getItemOneResult(String search, String kind) throws Exception {
		Pager pager = new Pager();
		pager.setKind(kind);
		pager.setSearch(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
	}
	
	@GetMapping("pettx")
	public void getPetTaxi () {
		
	}
}
