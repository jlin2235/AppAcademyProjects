export const allTodos = (state) => {

    const keys = Object.keys(state.todos);
    const newArr = [];
    keys.forEach(key => {
        newArr.push(state.todos[key]);
    })
    return newArr;
};

