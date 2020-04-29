package cn.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bean.Employee;
import cn.edu.bean.EmployeeExample;
import cn.edu.bean.EmployeeExample.Criteria;
import cn.edu.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper empMapper;
	
	public List<Employee> selectAll() {
		List<Employee> selectByExample = empMapper.selectByExample(null);
		return selectByExample;
	}

	public int setEmp(Employee emp) {
		int row = empMapper.insert(emp);
		return row;
	}

	public boolean getEmpName(String empName) {
		EmployeeExample rules = new EmployeeExample();
		Criteria criteria = rules.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		
		long count = empMapper.countByExample(rules);
		return count == 0;
	}
	
}
