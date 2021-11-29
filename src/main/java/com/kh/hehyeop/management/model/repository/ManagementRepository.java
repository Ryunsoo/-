package com.kh.hehyeop.management.model.repository;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.management.model.dto.Icebox;
import org.apache.ibatis.annotations.Update;
import com.kh.hehyeop.management.model.dto.ShoppingList;
import com.kh.hehyeop.management.validator.FixedForm;
import com.kh.hehyeop.management.validator.PersonalForm;

@Mapper
public interface ManagementRepository {

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and category=#{category} order by ex_date")
	List<Icebox> selectIceboxList(@Param("id")String id, @Param("category") int category);

	@Select("select * from shopping_list where id = #{id} and status = 1")
	List<ShoppingList> selectPurchaseListById(@Param("id") String id);
	
	@Select("select * from shopping_list where id = #{id} and status = 0")
	List<ShoppingList> selectExhaustListById(@Param("id") String id);

	@Delete("delete from shopping_list where shopping_idx = #{shoppingIdx}")
	int deleteItemByShoppingIdx(@Param("shoppingIdx") String shoppingIdx);

	@Insert("insert into shopping_list(shopping_idx, id, item, status) values(sc_shopping_idx.nextval, #{id}, #{item}, 1)")
	int insertInputItem(@Param("id") String id, @Param("item") String item);

	@Update("update shopping_list set status = 1 where id = #{id} and shopping_idx = #{shoppingIdx}")
	int updateItemStatus(@Param("id") String id, @Param("shoppingIdx") String shoppingIdx);

	@Insert("insert into expense values(sc_expense_idx.nextval, #{form.category}, #{id}, #{form.content}, #{form.price}, #{form.expDate})")
	void insertPersonalSpend(@Param("id")String id, @Param("form") PersonalForm form);

	void insertFixedSpend(@Param("id")String id, @Param("form")FixedForm form);

	@Insert("insert into icebox values(sc_ice_idx.nextval, #{id}, #{item}, #{category}, #{date}, current_date)")
	int insertIceboxItem(@Param("id")String id, @Param("item")String item, @Param("date")String date, @Param("category")int category);

	@Insert("insert into shopping_list values(SC_SHOPPING_IDX.nextval, #{id}, #{item}, 0)")
	void insertShoppingItem(@Param("id")String id, @Param("item")String item);

	@Delete("delete from icebox where ice_idx = #{iceIdx}")
	void deletedeleteIceboxItem(@Param("iceIdx")String iceIdx);

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and floor(EX_DATE - sysdate) <= 3 order by ex_date")
	List<Icebox> selectIceboxBellList(@Param("id")String id);

	@Select("select count(*) from icebox v where id = #{id} and floor(EX_DATE - sysdate) <= 3")
	int selectBellCnt(@Param("id")String id);

}
