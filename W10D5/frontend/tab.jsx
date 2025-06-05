import React from 'react';

class Tab extends React.Component {
    constructor(tabs) {
        this.tabs = tabs;
        this.state = {
            index: 0
        }
    }

    render() {
        const allTabs = this.tabs.map((tab, idx) => {
            return <h1>{idx}</h1>
        });
        return (<div>something {allTabs}</div>)
    }
}

export default Tab;