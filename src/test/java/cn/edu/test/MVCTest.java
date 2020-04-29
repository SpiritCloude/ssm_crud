package cn.edu.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.edu.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcher-servlet.xml"})
public class MVCTest {
	@Autowired
	WebApplicationContext webApplicationContext; 
	
	MockMvc mockMvc;
	
	@Before
	public void InitMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}
	
	@Test
	public void test() {
		try {
			MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pNum", "5")).andReturn();
			MockHttpServletRequest request = mvcResult.getRequest();
			PageInfo<Employee> pInfo = (PageInfo<Employee>) request.getAttribute("pInfo");
			System.out.println("当前页" + pInfo.getPageNum());
			System.out.println("总页码" + pInfo.getPages());
			System.out.println("总记录数" + pInfo.getTotal());
			System.out.println("===========连续页码===========");
			int[] nums = pInfo.getNavigatepageNums();
			for (int i : nums ) {
				System.out.print("  "+i);
			}
			
			for (Employee emp : pInfo.getList()) {
				System.out.println("ID:"+ emp.getEmpId()+"--"+emp.getEmpName()+"--"+emp.getGender()+"--"+emp.getEmail());;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
