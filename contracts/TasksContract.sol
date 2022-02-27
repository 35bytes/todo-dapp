// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;


contract TasksContract {

    uint public taskCounter = 0;

    constructor() {
        createTask("Mi primera tarea de ejemplo", "Tengo que hacer algo");
    }

    event TaskCreated(
        uint id, 
        string title, 
        string description, 
        bool done, 
        uint createdAt
    );

    event TaskToggleDone (
        uint id, 
        bool done
    );

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }

    mapping (uint256 => Task) public tasks;

    function createTask(string memory _title, string memory _description) public {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp);
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp);
    }

    function toggleDone(uint _id) public {
        tasks[_id].done = !tasks[_id].done;
        emit TaskToggleDone(_id, tasks[_id].done);
    }
}