
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class ConfigParam(BaseModel):
    key: str
    value: list

class Payscale(BaseModel):
    rank: str
    yearly_rate: int

class Employee(BaseModel):
    name: str
    department: str
    role: str
    pto_hours: float
    pay_plan: Payscale

pto_cap = ConfigParam(key="pto_cap",value=[150])

a = Payscale(rank="a",yearly_rate=40000)
b = Payscale(rank="b",yearly_rate=70000)
c = Payscale(rank="c",yearly_rate=105000)

# Supplements for a DB
directory = [
        Employee(name="Connor Enterline",department="IT",role="Software Engineer",pto_hours=18.2,pay_plan=a),
        Employee(name="Dylan Bolen",department="IT",role="IT Helpdesk",pto_hours=23.2,pay_plan=b),
        Employee(name="Ben Stannard",department="IT",role="Software Engineer",pto_hours=59.8,pay_plan=b),
        Employee(name="JoAnn Paouncic",department="Accounting",role="Accountant",pto_hours=150,pay_plan=b),
        Employee(name="Mark Enterline",department="Tech",role="Tech IV",pto_hours=100.25,pay_plan=c)
    ]


@app.get("/")
def read_root():
    return directory

@app.get("/employee/depo/{department}")
def employees_in_department(department: str):
    emp_to_return = []
    for emp in range(len(directory)):
        if directory[emp].department and directory[emp].department == department:
            emp_to_return.append(directory[emp].name)
    return emp_to_return

@app.get("/employee/role/{role}")
def employees_with_role(role: str):
    emp_to_return = []
    for emp in range(len(directory)):
        if directory[emp].role and directory[emp].role == role:
            emp_to_return.append(directory[emp].name)
    return emp_to_return

@app.get("/employee/payscale/{rank}")
def employees_in_given_payscale(rank: str):
    emp_to_return = []
    for emp in range(len(directory)):
        if directory[emp].pay_plan.rank and directory[emp].pay_plan.rank == rank:
            emp_to_return.append(directory[emp].name) 
    return emp_to_return

@app.get("/employee/pto-cap")
def employees_at_cap_pto():
    emp_to_return = []
    if pto_cap.key and pto_cap.key == "pto_cap":
        for emp in range(len(directory)):
            if directory[emp].pto_hours and directory[emp].pto_hours >= pto_cap.value[0]:
                emp_to_return.append(directory[emp].name)
    return emp_to_return

@app.get("/employee/pto-allocation-request/{name}/{requested}")
def can_time_be_allocated(name: str,requested: float):
    if pto_cap.key and pto_cap.key == "pto_cap" and pto_cap.value[0] < requested:
        return {
            "possible": False,
            "message": "Requested time exceeds PTO capacity"
        } 
    for emp in range(len(directory)):
        if directory[emp].name and directory[emp].name == name:
            if directory[emp].pto_hours and directory[emp].pto_hours >= requested:
                return {
                    "possible": True,
                    "message": "Allocation Possible"
                }
            else:
                return {
                    "possible": False,
                    "message": "Allocation Impossible. Not Enough Hours"
                }
    return {
            "possible": False,
            "message": "Employee Not Found"
        }

