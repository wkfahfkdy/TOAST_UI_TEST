package co.kjm.gridPrj.service;

import java.util.List;

import co.kjm.gridPrj.vo.GridVO;

public interface GridService {

	List<GridVO> selectAllGrid() throws Exception;
	
}
