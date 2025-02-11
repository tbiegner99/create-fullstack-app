import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import AppContainer from './AppContainer';
import { urls } from '../utils/constants/urls';
 
function App() {
    return (
            <BrowserRouter>
                <Routes>
                    <Route path={urls.BASE_URL} element={<AppContainer />}>
                    
                    </Route>
                </Routes>
            </BrowserRouter>
    );
}

export default App;
