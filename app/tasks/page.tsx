"use client";
import { useEffect, useState } from "react";
import { supabase } from "../../lib/supabase";

export default function TasksPage() {
  const [tasks, setTasks] = useState<any[]>([]);
  const [newTask, setNewTask] = useState("");

  useEffect(() => { fetchTasks(); }, []);

  const fetchTasks = async () => {
    const { data } = await supabase.from("tasks").select("*").order("created_at");
    if (data) setTasks(data);
  };

  const addTask = async () => {
    if (!newTask) return;
    await supabase.from("tasks").insert({ title: newTask });
    setNewTask(""); fetchTasks();
  };

  const updateStatus = async (id: string, status: string) => {
    await supabase.from("tasks").update({ status }).eq("id", id); fetchTasks();
  };

  const deleteTask = async (id: string) => {
    await supabase.from("tasks").delete().eq("id", id); fetchTasks();
  };

  return (
    <div>
      <h2>Your Tasks</h2>
      <input placeholder="New task" value={newTask} onChange={(e) => setNewTask(e.target.value)} />
      <button onClick={addTask}>Add</button>
      <ul>
        {tasks.map((t) => (
          <li key={t.id}>
            {t.title} - {t.status}
            <button onClick={() => updateStatus(t.id, "todo")}>Todo</button>
            <button onClick={() => updateStatus(t.id, "doing")}>Doing</button>
            <button onClick={() => updateStatus(t.id, "done")}>Done</button>
            <button onClick={() => deleteTask(t.id)}>❌</button>
          </li>
        ))}
      </ul>
    </div>
  );
}
