package com.kh.hehyeop.purchase.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;

@Mapper
public interface PurchaseRepository {
	
	@Select("select join_idx, reg_idx, match_idx, PR.id, item_name, deal_loc, deal_time, ongoing, join_buy_num, PJ.id AS buyer_id, nickname, name, tell from purchase_register PR left join purchase_match PM"
			+ " using(reg_idx) left join purchase_join PJ using(join_idx) left join Member M on(M.id = PJ.id) where PR.id = #{id} OR PJ.id = #{id}")
	List<MyPurchaseInfo> selectMyPurchaseInfo(String id);
	
}
