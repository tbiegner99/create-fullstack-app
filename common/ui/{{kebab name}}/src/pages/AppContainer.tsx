import React from 'react';
import { Outlet } from 'react-router-dom';
import { connect } from 'react-redux';
import styles from './app.css';

function AppContent() {

    return (
        <section className={styles.appContainer}>

            <main className={styles.appContent}>
                <Outlet />
            </main>
            <footer>
            </footer>
        </section>
    );
}

const mapStateToProps = () => ({});

const mapDispatchToProps = () => ({});

const ReduxApp = connect(mapStateToProps, mapDispatchToProps)(AppContent);

function AppContainer() {
    return (
            <ReduxApp />
    );
}

export default AppContainer;
