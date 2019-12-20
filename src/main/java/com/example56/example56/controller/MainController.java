package com.example56.example56.controller;


import com.example56.example56.model.Task;
import com.example56.example56.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.Date;

@Controller
public class MainController {

    @Autowired
    private TaskService taskService;

//    @GetMapping("/")
//    public String home(HttpServletRequest request) {
//        request.setAttribute("tasks", taskService.findAll());
//        return "index";
//    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("mode", "MODE_HOME");
        return "index";
    }

    @GetMapping("/all-tasks")
    public String allTasks(Model model) {
        model.addAttribute("tasks", taskService.findAll());
        model.addAttribute("mode", "MODE_TASKS");
        return "index";
    }

    @PostMapping("/save-task")
    public String saveTask(@ModelAttribute Task task, BindingResult bindingResult, Model model) {
        task.setDateCreated(new Date());
        taskService.save(task);
        model.addAttribute("tasks", taskService.findAll());
        model.addAttribute("mode", "MODE_TASKS");
        return "index";
    }

    @GetMapping("/new-task")
    public String newTask(Model model) {
        model.addAttribute("mode", "MODE_NEW");
        return "index";
    }

    @GetMapping("/update-task")
    public String updateTask(@RequestParam int id, Model model) {
        model.addAttribute("task", taskService.findTask(id));
        model.addAttribute("mode", "MODE_UPDATE");
        return "index";
    }

    @GetMapping("/delete-task")
    public String deleteTask(@RequestParam int id, Model model) {
        taskService.delete(id);
        model.addAttribute("tasks", taskService.findAll());
        model.addAttribute("mode", "MODE_TASKS");
        return "index";
    }
}
