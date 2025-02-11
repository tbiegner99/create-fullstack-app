import { configureStore } from '@reduxjs/toolkit';

// import singleSpaReact from 'single-spa-react';
import { DispatcherFactory } from '@tbiegner99/ui-app-components';
import React from 'react';
import ReactDOM from 'react-dom';  
import rootReducer from './reducers/rootReducer';
import App from './pages/App';
import { ViewportContextProvider } from './context/ViewportContext';
import { Provider } from 'react-redux';

declare global {
    interface Window {
        Environment: any;
    }
}

const store = configureStore({ reducer: rootReducer });
DispatcherFactory.setDispatchingStrategy(store);



export function Main(props: any) {
    return (
        <Provider store={store}>
            <ViewportContextProvider>
                    <App {...props} />
            </ViewportContextProvider>
        </Provider>
    );
}



// const reactLifecycles = singleSpaReact({
//     React,
//     ReactDOM,
//     rootComponent: Main,
//     errorBoundary(/* err, info, props */) {
//         // https://reactjs.org/docs/error-boundaries.html
//         return <div>This renders when a catastrophic error occurs</div>;
//     }
// });

// export const { bootstrap } = reactLifecycles;
// export const { mount } = reactLifecycles;
// export const { unmount } = reactLifecycles;
