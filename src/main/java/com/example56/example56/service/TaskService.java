package com.example56.example56.service;

import com.example56.example56.dao.TaskRepository;
import com.example56.example56.model.Task;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class TaskService {

    private final TaskRepository taskRepository;


    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> findAll() {
        List<Task> tasks = new ArrayList<Task>();
        for (Task task : taskRepository.findAll()) {
            tasks.add(task);
        }
        return tasks;
    }

    public Task findTask(int id){
        return taskRepository.findOne(id);
    }

    public void save(Task task) {
        taskRepository.save(task);
    }

    public void delete(int id) {
        taskRepository.delete(id);
    }
}
