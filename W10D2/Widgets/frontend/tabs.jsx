import React from 'react'

class Tabs extends React.Component {

    constructor (props) {
        // debugger
        super(props); 
        this.props = props;
        this.state = {idx: 0};
    }

    render () {
        // debugger
        return (
            <h1>Tabs
                <div>
                    <span>{this.props.array[0].title}</span>
                    <span>{this.props.array[1].title}</span>
                    <span>{this.props.array[2].title}</span>
                </div> 
            </h1>
        )
    }

}
export default Tabs;

// http://localhost:5500/Widgets/index.html

// render() {
//     return (
//         <div>
//             <h1>Tabs</h1>
//             <div className='header'>
//                 {this.titles}
//             </div>
//             <div className='content'>
//                 {this.content[this.state.selectedIdx]}
//             </div>
//         </div>
//     )
// }