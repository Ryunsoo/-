package com.kh.hehyeop.purchase.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.validator.RegisterForm;

@Mapper
public interface PurchaseRepository {
	
	@Insert("insert into purchase_register(reg_idx, id, item_name, item_link, deal_loc, end_time, deal_time, price, total_num, buy_num, content, rest_num) "
			+ "values (sc_reg_idx.nextval, #{id}, #{itemName}, #{itemLink}, #{dealLoc}, #{endTime}, #{dealTime}, #{price}, #{totalNum}, #{buyNum}, #{content}, #{restNum})")
	int registerInfo(RegisterForm form);

	@Select("select reg_idx from purchase_register p where rownum = 1 order by reg_idx desc")
	String selectRegIdx();

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_file_idx.nextval, 'PURCHASE', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	int uploadFile(FileDTO fileUpload);

	@Select("select * from V_SELECT_PURCHASE_REQUEST where reg_idx = #{regIdx}")
	MyPurchaseInfo selectPurchaseInfoByIdx(@Param("regIdx") String regIdx);
	
	@Select("select join_buy_num, nickname, name, tell, PR.id from purchase_register PR left join purchase_match PM "
			+ "using(reg_idx) left join purchase_join PJ using(join_idx) left join Member M on(M.id = PJ.id) where reg_idx = #{regIdx}")
	List<MyPurchaseInfo> purchaseParticipantsList(@Param("regIdx") String regIdx);

	List<PurchaseMain> selectRegisterList(@Param("grade") String grade, @Param("addressList") List<String> addressList, @Param("keyword") String keyword, @Param("paging") Paging paging);
	
	List<Object> selectjoinCount(@Param("grade") String grade, @Param("addressList") List<String> addressList, @Param("keyword") String keyword);
	
	int countMyPurchase(@Param("ongoing") String ongoing, @Param("done") String done, @Param("id") String id);

	List<MyPurchaseInfo> selectMyPurchaseInfo(@Param("paging") Paging paging
											, @Param("ongoing") String ongoing
											, @Param("done") String done
											, @Param("id") String id);

	@Select("select address1, address2, address3 from my_area where id = #{id}")
	MyAddress selectAddress(String id);

	int countRegister(@Param("grade") String grade, @Param("addressList") List<String> addressList, @Param("keyword") String keyword);

	@Insert("insert into purchase_join(join_idx, id, join_buy_num) values (sc_join_idx.nextval, #{id}, #{buyNum})")
	void purchaseRequest(@Param("buyNum") int buyNum, @Param("id") String id);

	@Insert("insert into purchase_match(match_idx, reg_idx, join_idx, rest_num, cash_lock) values (sc_match_idx.nextval, #{regIdx}, #{join_idx}, #{restNum} , #{matchLockedCash})")
	void purchaseMatch(@Param("regIdx") String regIdx, @Param("restNum") int restNum, @Param("join_idx") String join_idx, @Param("matchLockedCash") int matchLockedCash);

	@Select("select join_idx from (select join_idx, rownum rnum from purchase_join order by join_idx desc) where rownum = 1")
	String selectJoinIdx();

	@Update("update wallet set cash = #{cash}, cash_lock =  cash_lock+#{WalletLockedCash}  where id = #{id}")
	void updateWallet(@Param("id") String id, @Param("cash") int cash, @Param("WalletLockedCash") int WalletLockedCash);

	@Select("select cash from wallet where id = #{id}")
	int getCash(@Param("id") String id);

	@Select("select * from v_select_purchase_detail where reg_idx = #{regIdx}")
	DetailInfo selectPurchaseDetail(String regIdx);

	@Select("select NVL(sum(join_buy_num), 0) as join_num from purchase_match left join purchase_join using(join_idx) where reg_idx = #{regIdx}")
	int selectBuyNum(String regIdx);

	@Update("update member set point = point + 3 where id = #{id}")
	void updatePoint(String id);

	@Select("select id from purchase_join join purchase_match using (join_idx) where reg_idx = #{regIdx}")
	List<String> selectJoinId(String regIdx);
	
	@Select("select join_idx from purchase_join join purchase_match using (join_idx) where reg_idx = #{regIdx} and ongoing = 0")
	List<String> selectJoinList(String regIdx);

	void updateJoinStatus(@Param("joinIdxList") List<String> joinIdxList);

	@Select("select distinct ongoing from v_select_join_and_match where reg_idx = #{regIdx} and id = #{id}")
	Integer ongoing(@Param("regIdx") String regIdx, @Param("id") String id);

	@Select("select cash_lock from v_select_join_and_match where reg_idx = #{regIdx} and id = #{id}")
	int selectLockedCash(@Param("id") String id, @Param("regIdx") String regIdx);

	@Update("update wallet set cash = cash+#{lockedCash} where id = #{sellerId}")
	void sendCashtoSeller(@Param("sellerId") String sellerId, @Param("lockedCash") int lockedCash);

	@Select("select cash_lock from wallet where id = #{id}")
	int getTotalLockedCash(@Param("id") String id);

	@Update("update purchase_match set cash_lock = 0, ongoing = 2  where join_idx = #{joinIdx} and reg_idx = #{regIdx}")
	void updateMatchLockedCashAndOngoing(@Param("joinIdx") String joinIdx, @Param("regIdx") String regIdx);

	@Update("update wallet set cash_lock = #{totalLockedcash} where id = #{id}")
	void updateWalletLockedCash(@Param("id") String id, @Param("totalLockedcash") int totalLockedcash);

	@Select("select join_idx from v_select_join_and_match where id= #{id} and reg_idx = #{regIdx}")
	String selectMyJoinIdx(@Param("id") String id, @Param("regIdx") String regIdx);

	@Update("update purchase_register set done = 'Y' where reg_idx = #{regIdx}")
	void dealDone(String regIdx);

	@Update("update member set point = point+1 where id = #{id}")
	void purchaseUpdatePoint(String id);
	
	@Update("update member set point = point+3 where id = #{sellerId}")
	void SellerUpdatePoint(String sellerId);

	@Select("select distinct reg_idx from v_select_batch where ongoing = 1 or ongoing = 2")
	List<String> selectRegIdxList();
	
	@Select("select * from purchase_match where reg_idx = #{regIdx}")
	List<String> findBuyer(@Param("regIdx") String regIdx);

	@Update("update purchase_match set cash_lock = 0, ongoing = 3 where join_Idx = #{joinIdx} and reg_idx = #{regIdx}")
	void buyerCancel(@Param("joinIdx") String joinIdx, @Param("regIdx") String regIdx);

	@Update("update wallet set cash_lock = cash_lock-#{cash}, cash = cash+#{cash} where id = #{id}")
	void returnLockedCash(@Param("id") String id, @Param("cash") int cash);

	@Update("update purchase_register set rest_num = rest_num + #{buyNum} where reg_idx=#{regIdx}")
	void plusRestNum(@Param("regIdx") String regIdx, @Param("buyNum") int buyNum);

	void updateOngoing(@Param("regIdxList") List<String> regIdxList);
	
	@Select("select reg_idx, id, item_name, done, match_idx, join_idx, ongoing from purchase_register left join purchase_match using (reg_idx) where reg_idx = #{regIdx} and id = #{id}")
	MyPurchaseInfo detailRemoveCheck(@Param("regIdx") String regIdx, @Param("id") String id);
	
	@Delete("delete from purchase_register where reg_idx = #{regIdx} and id = #{id}")
	void detailRemove(@Param("regIdx") String regIdx, @Param("id") String id);
	
	@Update("update file_info set is_del = 1 where type_idx = #{regIdx} and file_category = 'purchase'")
	void detailRemoveFile(@Param("regIdx") String regIdx);

	@Select("select rest_num from purchase_match where join_idx = #{joinIdx}")
	int selectCancelBuyNum(@Param("joinIdx") String joinIdx);
	
	@Update("update purchase_register set done = 'F' where reg_Idx = #{regIdx}")
	void updateDone(String regIdx);

}
