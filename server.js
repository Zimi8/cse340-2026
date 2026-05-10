import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3000;


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));


app.use(express.static('public'));


app.get('/', async (req, res) => {
    res.render('home', { title: 'Home' });
});

app.get('/organizations', async (req, res) => {
    res.render('organizations', { title: 'Our Partner Organizations' });
});

app.get('/projects', async (req, res) => {
    res.render('projects', { title: 'Service Projects' });
});

app.listen(PORT, () => {
    console.log(`Server running at http://127.0.0.1:${PORT}`);
});