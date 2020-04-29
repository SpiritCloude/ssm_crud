package cn.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.bean.Employee;
import cn.edu.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	@RequestMapping(value = "/emps")
	public String getEmps(@RequestParam(value = "pNum", defaultValue = "1") Integer pNum, Model model) {
		// 获取第几页，几条内容
		PageHelper.startPage(pNum, 5);
		List<Employee> list = employeeService.selectAll();
		// 用PageInfo对结果进行包装
		PageInfo<Employee> pInfo = new PageInfo<Employee>(list, 5);
		model.addAttribute("pInfo", pInfo);
		System.out.println("emps" + pInfo);
		return "list";
	}

	@ResponseBody
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public Map<String, Object> saveEmp(@Valid Employee emp,BindingResult result) {
		Map<String, Object> map =new HashMap<String, Object>();
		List<FieldError> errors = result.getFieldErrors();
		if (result.hasErrors()) {
			for (FieldError error : errors) {
				String errorId = error.getField();
				String msg = error.getDefaultMessage();
				map.put(errorId, msg);
			}
			System.out.println("saveEmp errors");
			return map;
		} else {
			int row = employeeService.setEmp(emp);
			map.put("row", row);
			System.out.println("saveEmp success");
			return map;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkEmpName", method = RequestMethod.POST)
	public Map<String, Object> checkEmp(@RequestParam("empName") String empName) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isError = false;
		String regName = "([a-zA-Z0-9_-]{6,12}$)|(^[\u2E80-\u9FFF]{2,5})";
		if (!empName.matches(regName)) {
			map.put("status", isError);
			map.put("msg", "用户名由6-12字母数字下划线或3-4位汉字组成");
			return map;
		}
		isError = employeeService.getEmpName(empName);
		map.put("status", isError);
		map.put("msg", "用户名已存在");
		return map;

	}
}
