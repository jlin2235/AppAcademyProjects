import React from "react"; //we this this
import ReactDOM from 'react-dom';
import App from "./components/app";
import configureStore from "./store/store"
import { receiveTodos,receiveTodo } from "./actions/todo_actions";
import Root from './components/root';
import { allTodos } from './reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
    window.store = configureStore;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.allTodos = allTodos;
    const rootEl = document.getElementById("root");
    ReactDOM.render(<Root store = {configureStore} />, rootEl)
})