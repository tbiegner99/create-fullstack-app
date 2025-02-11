import { configureStore } from '@reduxjs/toolkit';

// import singleSpaReact from 'single-spa-react';
import { DispatcherFactory  } from '@tbiegner99/ui-app-components';
import React from 'react';
import {createRoot} from 'react-dom/client';  
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
(DispatcherFactory as any).setDispatchingStrategy(store); 



export function Main(props: any) {
    return (
        <Provider store={store}>
            <ViewportContextProvider>
                    <App {...props} />
            </ViewportContextProvider>
        </Provider>
    );
}

const root = createRoot(document.getElementsByTagName("body")[0]!);
root.render(<Main />);