import express, { Request, Response } from 'express';
import { controllers } from './dependencies';
import { HTTPStatus } from './utils/constants';

export const router = express.Router();
