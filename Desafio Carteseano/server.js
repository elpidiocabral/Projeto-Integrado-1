import postgres from 'postgres'
const express = require('express')
const app = express()
app.use(express.json());

const sql = postgres({})

await sql`
    select * from teste1
`
