import { Pool } from 'postgresql-client';

const pool = new Pool({
  host: 'localhost',
  port: 5432,
  user: '{{kebab name}}',
  password: '{{kebab name}}',
  database: '{{kebab name}}',

  min: 1,
  max: 10,
  idleTimeoutMillis: 15000,
});

export const datasources = {};

export const services = {};

export const controllers = {};
