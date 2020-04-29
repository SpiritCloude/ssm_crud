package cn.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bean.Department;
import cn.edu.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	DepartmentMapper deptMapper;
	public List<Department> getDepts() {
		List<Department> depts = deptMapper.selectByExample(null);
		return depts;
	}

}
