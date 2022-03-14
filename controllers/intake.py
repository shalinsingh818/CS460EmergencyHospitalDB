

class CreateIntake(Resource):
  def __init__(self):
		pass

	def get(self):
		return {
			"Message": "Hello"
		}

    
  def post(self):
		if request.method == 'POST':
			# capturing from postman
      admitted = request.form.get('admitted')	
			ambulance = request.form.get('ambulance')
			blood_pressure = request.form.get('blood_pressure')	
			date_discarged = request.form.get('date_discarged')
      date_posted = request.form.get('date_posted')	
			diagnosis = request.form.get('diagnosis')	
			discharge = request.form.get('discharge')	
			intake_id = request.form.get('intake_id')
      notes = request.form.get('notes')
			patient_id = request.form.get('patiend_id')
      procedure = request.form.get('procedure')

    # create patient in database
      dict_input = {
        "admitted": admitted,
        "ambulance": ambulance,
        "blood_pressure": blood_pressure,
        "date_discharged": date_discharged,
        "date_posted": date_posted,
        "diagnosis": diagnosis,
        "discharge": discharge,
        "intake_id": intake_id,
        "notes": notes,
        "patient_id": patient_id,
        "procedure": procedure,
            
    }