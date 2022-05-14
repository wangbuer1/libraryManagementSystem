package main.web.controller.admin;

import main.constant.Constant;
import main.dao.StudentDao;
import main.dao.domain.Student;
import main.web.bean.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/student")
public class AdmStudentController {

    @Resource
    private StudentDao studentDao;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap model) {
        String username = (String) request.getSession().getAttribute(Constant.user_name);
        model.addAttribute("username", username);
        return "admin/student";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public PageBean<Student> list(ModelMap model, Student student) {
        List<Student> students = studentDao.find(student);
        PageBean<Student> data = new PageBean<Student>();
        data.setData(students);
        return data;
    }

    @ResponseBody
    @RequestMapping(value = "/findById", method = {RequestMethod.GET, RequestMethod.POST})
    public Student findById(ModelMap model, Student student) {
        return studentDao.findById(student);
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = {RequestMethod.GET, RequestMethod.POST})
    public int save(ModelMap model, Student student) {
        Student stu = studentDao.findBySno(student);
        if (stu != null) {
            return -1;
        }
        return studentDao.save(student) ? 1 : 0;
    }

    @ResponseBody
    @RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean update(ModelMap model, Student student) {
        return studentDao.update(student);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean delete(ModelMap model, Student student) {
        return studentDao.delete(student);
    }
}