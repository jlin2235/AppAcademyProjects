import { connect} from 'react_redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup'

const mdp = dispatch => ({
    createNewUser: formUser => dispatch(createNewUser(formUser)),
});

export default connect(null, mdp)(Signup)