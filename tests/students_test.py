def test_get_assignments_student_1(client, h_student_1):
    response = client.get(
        '/student/assignments',
        headers=h_student_1
    )

    assert response.status_code == 200

    data = response.json['data']
    for assignment in data:
        assert assignment['student_id'] == 1


def test_get_assignments_student_2(client, h_student_2):
    response = client.get(
        '/student/assignments',
        headers=h_student_2
    )

    assert response.status_code == 200

    data = response.json['data']
    for assignment in data:
        assert assignment['student_id'] == 2


def test_post_assignment_null_content(client, h_student_1):
    """
    failure case: content cannot be null
    """

    response = client.post(
        '/student/assignments',
        headers=h_student_1,
        json={
            'content': None
        })

    assert response.status_code == 400


def test_post_assignment_student_1(client, h_student_1):
    content = 'ABCD TESTPOST'

    response = client.post(
        '/student/assignments',
        headers=h_student_1,
        json={
            'content': content
        })

    assert response.status_code == 200

    data = response.json['data']
    assert data['content'] == content
    assert data['state'] == 'DRAFT'
    assert data['teacher_id'] is None


def test_submit_assignment_student_1(client, h_student_1):
    response = client.post(
        '/student/assignments/submit',
        headers=h_student_1,
        json={
            'id': 2,
            'teacher_id': 2
        })

    assert response.status_code == 200

    data = response.json['data']
    assert data['student_id'] == 1
    assert data['state'] == 'SUBMITTED'
    assert data['teacher_id'] == 2


def test_assignment_resubmit_error(client, h_student_1):
    response = client.post(
        '/student/assignments/submit',
        headers=h_student_1,
        json={
            'id': 2,
            'teacher_id': 2
        })
    error_response = response.json
    assert response.status_code == 400
    assert error_response['error'] == 'FyleError'
    assert error_response["message"] == 'only a draft assignment can be submitted'

def test_assignment_submit_null_teacher(client, h_student_1):
    """
        failure case: teacher_id cannot be null
    """
    response = client.post(
        '/student/assignments/submit',
        headers=h_student_1,
        json={
            'id': 2,
            'teacher_id': None
        })

    assert response.status_code == 400

def test_assignment_submit_cross(client, h_student_2):
    """
        failure case: assignment id 2 is owned by student 1
    """
    response = client.post(
        '/students/assignments/submit',
        headers=h_student_2,
        json={
            'id': 2,
            'teacher_id': 1
        }
    )
    
    assert response.status_code == 404

def test_edit_assignment_of_another_student(client, h_student_2):
    """
        failure case: assignment id 2 is owned by student 1
    """
    response = client.post(
        '/students/assignments',
        headers=h_student_2,
        json={
            'id': 2,
            'content': 'Some text that will not be updated'
        }
    )
    
    assert response.status_code == 404

def test_submit_assignment_teacher_does_not_exist(client, h_student_1):
    """
        failure case: assignment cannot be sunmitted to non existent teacher
    """
    response = client.post(
        '/students/assignments/submit',
        headers=h_student_1,
        json={
            'id': 2,
            'teacher_id': 100002
        }
    )
    
    assert response.status_code == 404
    data = response.json

    assert data['error'] == 'NotFound'

def test_get_all_submitted_graded_assignments(client, h_student_1):
    """
        failure case: trying to get all assignments from principal endpoint
    """
    response = client.get(
        '/principals/assignments',
        headers=h_student_1
    )
    
    assert response.status_code == 404