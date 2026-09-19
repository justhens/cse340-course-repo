import db from './db.js'

const getAllCategories = async() => {
    const query = `
        SELECT category_id, name, date_added
      FROM public.category;
    `;

    const result = await db.query(query);

    return result.rows;
}
const getCategoryDetails = async (id) => {
    const query = `
        SELECT category_id, name, date_added
        FROM category
        WHERE category_id = $1;
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    return result.rows[0];
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT c.category_id, c.name
        FROM category c
        JOIN project_category pc ON c.category_id = pc.category_id
        WHERE pc.project_id = $1
        ORDER BY c.name;
    `;

    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT p.project_id, p.title
        FROM project p
        JOIN project_category pc ON p.project_id = pc.project_id
        WHERE pc.category_id = $1
        ORDER BY p.title;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows;
};
export {getAllCategories, getCategoryDetails, getCategoriesByProjectId, getProjectsByCategoryId}