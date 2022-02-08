from django.shortcuts import render
from .tasks import add_num


def main(request):
  if request.method == 'POST':
    q = request.POST.get('q')
    q_list = list(map(int, q.split(',')))
    res = add_num.delay(q_list[0], q_list[1])
    sum_q = res.get(timeout=1)

    return render(request, "base.html", {'sum_value':sum_q})

  return render(request, "base.html")