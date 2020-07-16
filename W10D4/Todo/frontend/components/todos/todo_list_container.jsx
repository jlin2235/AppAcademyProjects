import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors';

const msp = (state) = {
    const todos = allTodos(state);
}
