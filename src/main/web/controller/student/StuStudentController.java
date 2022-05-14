package main.web.controller.student;

import main.constant.Constant;
import main.dao.StudentDao;
import main.dao.domain.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/student/student")
public class StuStudentController {

    @Resource
    private StudentDao studentDao;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap model) {
        String username = (String) request.getSession().getAttribute(Constant.user_name);
        Integer id = (Integer) request.getSession().getAttribute(Constant.user_id);
        Student student = new Student();
        student.setId(id);
        student = studentDao.findById(student);
        model.addAttribute("username", username);
        model.addAttribute("student", student);
        return "student/student";
    }


    @ResponseBody
    @RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
    public int update(ModelMap model, Student student) {
        Student stu = studentDao.findById(student);
        if (stu == null) {
            return -1;
        }
        if (!stu.getPassword().equals(student.getPassword())) {
            return -2;
        }
        student.setPassword(student.getPasswordNew());
        return studentDao.update(student) ? 1 : 0;
    }
}