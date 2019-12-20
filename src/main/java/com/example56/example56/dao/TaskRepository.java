package com.example56.example56.dao;

import com.example56.example56.model.Task;
import org.springframework.data.repository.CrudRepository;

public interface TaskRepository extends CrudRepository<Task, Integer> {


}
