package co.kjm.gridPrj.mappers;

import java.util.List;

import co.kjm.gridPrj.vo.GridVO;

public interface GridMapper {
	
	List<GridVO> selectAllGrid() throws Exception;
	
}
