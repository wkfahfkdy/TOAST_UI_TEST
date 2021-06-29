package co.kjm.gridPrj;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kjm.gridPrj.service.GridService;
import co.kjm.gridPrj.vo.GridVO;

@Controller
public class HomeController {
	
	@Autowired
	private GridService gridDao;
	
	@RequestMapping(value = "/")
	public String home(Model model) throws Exception {
		
		ArrayList<GridVO> list = new ArrayList<GridVO>();
		list = (ArrayList<GridVO>) gridDao.selectAllGrid();
		
		System.out.println("selectAllGrid data : " + list);
		
		model.addAttribute("list", list);
		
		return "home";
	}
	
	@RequestMapping("chartTest.do")
	public String chartTest() {
		
		return "chartTest";
	}
	
	@RequestMapping("chartJS.do")
	public String chartJs() {
		
		return "chartJS";
	}
}
