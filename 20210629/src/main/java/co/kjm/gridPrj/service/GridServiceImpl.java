package co.kjm.gridPrj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kjm.gridPrj.mappers.GridMapper;
import co.kjm.gridPrj.vo.GridVO;

@Repository("gridDao")
public class GridServiceImpl implements GridService {

	@Autowired
	private GridMapper map;
	
	@Override
	public List<GridVO> selectAllGrid() throws Exception {
		
		return map.selectAllGrid();
	}

}
