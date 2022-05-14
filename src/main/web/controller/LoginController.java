package main.web.controller;

import main.constant.Constant;
import main.dao.AdminDao;
import main.dao.StudentDao;
import main.dao.domain.Admin;
import main.dao.domain.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class LoginController {

    @Resource
    private StudentDao studentDao;

    @Resource
    private AdminDao adminDao;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap model) {
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public int studentLogin(HttpServletRequest request, String username,
                            String password, int role) {
        if (role == 1) {
            Student student = new Student();
            student.setSno(username);
            Student stu = studentDao.findBySno(student);
            if (stu == null) {
                return -1;
            } else {
                if (password.equals(stu.getPassword())) {
                    request.getSession()
                            .setAttribute(Constant.student_login_session_name,
                                    stu.getSno());
                    request.getSession().setAttribute(
                            Constant.user_id, stu.getId());
                    request.getSession().setAttribute(
                            Constant.user_name,
                            stu.getSname());
                    return 1;
                } else {
                    return -2;
                }
            }
        } else if (role == 2) {
            Admin admin = new Admin();

            admin.setAno(username);
            Admin adm = adminDao.findByAno(admin);
            if (adm == null) {
                return -1;
            } else {
                if (password.equals(adm.getPassword())) {
                    request.getSession()
                            .setAttribute(Constant.admin_login_session_name,
                                    adm.getAno());
                    request.getSession().setAttribute(
                            Constant.user_id, adm.getId());
                    request.getSession().setAttribute(
                            Constant.user_name,
                            adm.getAname());
                    return 1;
                } else {
                    return -2;
                }
            }
        } else {
            return 0;
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute(
                Constant.student_login_session_name, null);
        request.getSession().setAttribute(
                Constant.admin_login_session_name, null);
        return "login";
    }
}
