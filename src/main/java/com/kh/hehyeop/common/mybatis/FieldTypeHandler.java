package com.kh.hehyeop.common.mybatis;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class FieldTypeHandler extends BaseTypeHandler{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType)
			throws SQLException {
		
		ArrayDescriptor descriptor =
				ArrayDescriptor.createDescriptor("FIELD_ARRAY", ps.getConnection());
		
		List<String> fields = (List<String>)parameter;
		ARRAY fieldArr = new ARRAY(descriptor, ps.getConnection(), fields.toArray());
		ps.setArray(i, fieldArr);
		
	}

	@Override
	public Object getNullableResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
