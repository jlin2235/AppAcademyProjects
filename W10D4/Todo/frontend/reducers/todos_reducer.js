import { merge } from 'lodash';
import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done:  false
  },
  
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_TODOS:
            const newState = {}
            action.todos.forEach(todo => {
                newState[todo["id"]] = todo; //"id" of .id
            });
            return newState;
        case RECEIVE_TODO:
            // debugger;
            const { id, title, body, done } = action.todo;
            const addTodo = {
                [id]: {
                    id,
                    title,
                    body,
                    done
                }
            }
            const newerState = merge({}, state, addTodo);
            return newerState;
        default:
            return state;  
    }
};

export default todosReducer;