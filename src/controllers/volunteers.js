import { addVolunteer, removeVolunteer } from '../models/volunteers.js';

const processVolunteer = async (req, res, next) => {
    try {
        const projectId = req.params.projectId;
        await addVolunteer(req.session.user.user_id, projectId);

        req.flash('success', 'Thank you for volunteering!');
        res.redirect(`/project/${projectId}`);
    } catch (error) {
        next(error);
    }
};
const processUnvolunteer = async (req, res, next) => {
    try {
        const projectId = req.params.projectId;
        await removeVolunteer(req.session.user.user_id, projectId);

        req.flash('success', 'You are no longer volunteering for this project.');

        if (req.body.returnTo === 'dashboard') {
            return res.redirect('/dashboard');
        }
        res.redirect(`/project/${projectId}`);
    } catch (error) {
        next(error);
    }
};

export { processVolunteer, processUnvolunteer };