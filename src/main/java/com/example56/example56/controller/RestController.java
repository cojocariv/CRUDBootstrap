package com.example56.example56.controller;

import com.example56.example56.model.Task;
import com.example56.example56.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    @Autowired
    private TaskService taskService;

//    @GetMapping("/all-tasks")
//    public String allTasks() {
//        return taskService.findAll().toString();
//    }
//
//    @GetMapping("/save-task")
//    public String saveTask(@RequestParam String name, @RequestParam String desc) {
//        Task task = new Task(name, desc, new Date(), false);
//        taskService.save(task);
//        return "Task saved!";
//    }
//
//    @GetMapping("/delete-task")
//    public String saveTask(@RequestParam int id) {
//       taskService.delete(id);
//        return "Task deleted!";
//    }
}
