package cn.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.bean.Department;
import cn.edu.service.DepartmentService;

@Controller
public class DepartmentController {
	
	@Autowired
	DepartmentService deptService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public List<Department> getAllDept() {
		List<Department> depts = deptService.getDepts();
		return depts;
	}
}
