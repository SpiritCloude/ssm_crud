package cn.edu.test;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.dao.DepartmentMapper;
import cn.edu.dao.EmployeeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper dept;
	
	@Autowired
	EmployeeMapper emp;
	
	@Test
	public void testCRUT() {
		/*
		 * System.out.println(dept); dept.insert(new Department(5, "tset01"));
		 *dept.insertSelective(new Department(null, "test02"));
		 *
		 **/
		emp.deleteByPrimaryKey(1075);
	}
}
