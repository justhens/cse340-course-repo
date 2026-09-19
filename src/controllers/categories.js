import { getAllCategories, getCategoryDetails, getProjectsByCategoryId } from '../models/categories.js';

const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Project Categories';

    res.render('categories', { title, categories });
};

const showCategoryDetailsPage = async (req, res) => {
    const { id } = req.params;
    const category = await getCategoryDetails(id);
    const projects = await getProjectsByCategoryId(id);
    const title = category.name;

    res.render('category', { title, category, projects });
};

export { showCategoriesPage, showCategoryDetailsPage };