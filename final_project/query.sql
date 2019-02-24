select resp.id, resp.submitted_at, resp.survey_id, i.name as industry_name, resp.question_response_integer, resp.question_response_more 
from responses resp
left join surveys s on s.id = resp.survey_id
left join survey_templates st on s.survey_template_id = st.id
left join questions q on st.question_id = q.id
left join organizations o on o.id = resp.organization_id
left join industries i on i.id = o.industry_id
where resp.submitted_at is not null
and s.created_at >= '2018-01-01 00:00:00'
and resp.`question_response_more` is not null and resp.question_response_more != ''
and q.type = 'Question::ScaleQuestion'
and q.id = 1
limit 30000;


select resp.submitted_at, resp.question_response_integer AS response_integer, REPLACE(REPLACE(REPLACE(resp.question_response_more , '\r', ''), '\n', ''), ',', ';') AS response_text
from responses resp
left join surveys s on s.id = resp.survey_id
left join survey_templates st on s.survey_template_id = st.id
left join questions q on st.question_id = q.id
left join organizations o on o.id = resp.organization_id
where resp.submitted_at is not null
and s.created_at >= '2017-01-01 00:00:00'
and resp.`question_response_more` is not null and resp.question_response_more != ''
and q.type = 'Question::ScaleQuestion'
and q.question_category_id = 3
AND o.industry_id = 2
limit 30000;


select resp.submitted_at, resp.question_response_integer AS response_integer, REPLACE(REPLACE(REPLACE(resp.question_response_more , '\r', ''), '\n', ''), ',', ';') AS response_text
from responses resp
left join surveys s on s.id = resp.survey_id
left join survey_templates st on s.survey_template_id = st.id
left join questions q on st.question_id = q.id
left join organizations o on o.id = resp.organization_id
where resp.submitted_at is not null
and s.created_at >= '2017-01-01 00:00:00'
and resp.`question_response_more` is not null and resp.question_response_more != ''
and q.type = 'Question::TextQuestion'
and q.question_category_id = 3
AND o.industry_id = 2
limit 100;
